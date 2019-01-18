#include "CCShake.h"
#include "cocos2d.h"
USING_NS_CC;

// not really useful, but I like clean default constructors
CCShake::CCShake() : m_strength_x(0), m_strength_y(0)
{
}

CCShake *CCShake::create( float d, float strength )
{
    // call other construction method with twice the same strength
    return createWithStrength( d, strength, strength );
}

CCShake *CCShake::createWithStrength(float duration, float strength_x, float strength_y)
{
    CCShake *pRet = new CCShake();

    if (pRet && pRet->initWithDuration(duration, strength_x, strength_y))
    {
        pRet->autorelease();
    }
    else
    {
        CC_SAFE_DELETE(pRet);
    }


    return pRet;
}

bool CCShake::initWithDuration(float duration, float strength_x, float strength_y)
{
    if (CCActionInterval::initWithDuration(duration))
    {
        m_strength_x = strength_x;
        m_strength_y = strength_y;

        return true;
    }

    return false;
}

// Helper function. I included it here so that you can compile the whole file
// it returns a random value between min and max included
static float fgRangeRand( float min, float max )
{
    float rnd = ((float)rand() / (float)RAND_MAX);
    return rnd * (max - min) + min;
}

void CCShake::update(float dt)
{
    float randx = fgRangeRand( -m_strength_x, m_strength_x ) * dt;
    float randy = fgRangeRand( -m_strength_y, m_strength_y ) * dt;

    // move the target to a shaked position
    m_pTarget->setPosition( ccpAdd(m_StartPosition, ccp( randx, randy)));
}

void CCShake::startWithTarget(CCNode *pTarget)
{
    CCActionInterval::startWithTarget( pTarget );

    // save the initial position
    m_StartPosition=pTarget->getPosition();
}

void CCShake::stop(void)
{
    // Action is done, reset clip position
    this->getTarget()->setPosition( m_StartPosition);

    CCActionInterval::stop();
}